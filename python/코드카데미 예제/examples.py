from random import randint

def anti_vowel(txt):
    vowel='aeiouAEIOU'
    anti=""
    for char in txt:
        if char not in vowel:
            anti+=char
    return anti


def censor(txt, word):
    splt_txt = txt.split()
    censored = []
    for w in splt_txt:
        if w == word:
            w = '*' * len(word)
            censored.append(w)
        else:
            censored.append(w)

    return " ".join(censored)

def remove_duplicates(nums):
    new=[]
    for num in nums:
        if num not in new:
            new.append(num)
    return new

def median(nums):
    n=len(nums)
    check=sorted(nums)
    if n%2==0:
        a=check[n/2]
        b=check[n/2-1]
        return (a+b)/2
    else:
        return float(check[(n-1)/2])  #float!!!!
