install.packages('xgboost')
install.packages('Ckmeans.1d.dp')

library(xgboost)
library(caret)
library(ROCR)

setwd('J:/data/BA562')
cb <- read.delim("Hshopping.txt", stringsAsFactors=TRUE)  # XGBoost supports only numerics
head(cb)

# 1. test/training matrix 제작
set.seed(1)
inTrain <- createDataPartition(y=cb$나이, p=0.6, list=FALSE)
cb.train <- cb[inTrain,]
cb.test <- cb[-inTrain,]

### XGBoost supports only xgb.DMatrix, train matrix = predicting variable, label = predicted variable
train_matrix <- apply(cb.train[,-3], 2, as.numeric)
test_matrix <- apply(cb.test[-3], 2, as.numeric)
xgb_train_matrix <- xgb.DMatrix(data = as.matrix(train_matrix),label=cb.train$나이)
xgb_test_matrix <- xgb.DMatrix(data = as.matrix(test_matrix), label=cb.test$나이)

# 2. Training with gbtree
xgb_model <- xgb.train(data = xgb_train_matrix,
                       label = getinfo(xgb_train_matrix, "label"),
                       eta = 1, 
                       max.depth = 3, 
                       objective = "reg:linear",
                       nround = 10 
                       )

### train parameters
'label: vector of response values
 eta: control the learning rate, low eta = robust to overfitting, 
      0 < eta < 1, default=0.3
 max_depth: maximum depth of a tree. default=6
 objective: learning task & corresponding learning objective,
            default = reg:linear(continuous var.)
            for binary, binary:logistic
            for multiclass, multi:softmax
 nround: number of trees used for model building
'

features = colnames(train_matrix)
importance_matrix_1 <- xgb.importance(features, model = xgb_model)
print(importance_matrix_1)
xgb.ggplot.importance(importance_matrix_1)

### predict
pred_1 <- predict(xgb_model, xgb_test_matrix)
result_1 <- data.frame(ID = cb.test$ID,
                       age = cb.test$나이,
                       prediction = round(pred_1, digits = 2)
                       )
result_1$error = round(100*abs((result_1$prediction-result_1$age)/result_1$age)
                          ,digits=2)
accuracy = 100-mean(result_1$error)
accuracy

# 3. Training with gblinear
xgb_model2 <- xgb.train(data = xgb_train_matrix,
                       booster = "gblinear",
                       label = getinfo(xgb_train_matrix, "label"),
                       eta = 1, 
                       max.depth = 3, 
                       objective = "reg:linear",
                       nround = 10 
)

importance_matrix_2 <- xgb.importance(features, model = xgb_model2)
print(importance_matrix_2)
xgb.ggplot.importance(importance_matrix_2)

### predict
pred_2 <- predict(xgb_model2, xgb_test_matrix)
result_2 <- data.frame(ID = cb.test$ID,
                       age = cb.test$나이,
                       prediction = round(pred_2, digits = 2)
)
result_2$error = round(100*abs((result_2$prediction-result_2$age)/result_2$age)
                       ,digits=2)
accuracy2 = 100-mean(result_2$error)
accuracy2

# 4. using caret
xgb_model_crt <- caret::train(나이 ~ .,
                              data = cb.train,
                              method = "xgbTree",
                              preProcess = NULL,
                              trControl = trainControl(method = "repeatedcv", 
                                                       number = 2, repeats = 2, verboseIter = FALSE))
pred_3 <- predict(xgb_model_crt, cb.test)
result_3 <- data.frame(ID = cb.test$ID,
                       age = cb.test$나이,
                       prediction = round(pred_3, digits = 2)
)
result_3$error = round(100*abs((result_3$prediction-result_1$age)/result_3$age)
                       ,digits=2)
accuracy3 = 100-mean(result_3$error)
accuracy3