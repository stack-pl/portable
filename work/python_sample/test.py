import DiceBag

print(DiceBag.roll_dices(20, 100, 0))
print(DiceBag.rollOneSequence(['raz','dwa','trzy']))
print(DiceBag.rollManySequences([[1,2,3],[4,5,6],[7,8,9]]))

countTo = 50000
seq = [2,1,-1,-1,0,0]



# different number of rolls
for rs in range( 1, 26 ):
    acc = 0
    for i in range(countTo):
        score = 0
        for j in range (rs): #while True:
            rollScore = DiceBag.rollOneSequence(seq)
            score += rollScore
        acc += score
        #print(score, end=',')
    averageScore = acc/countTo
    print(str( rs ) + ' rolls : average score is ' + str( averageScore ))


acc = 0
for i in range(countTo):
    score = 0
    while True:
        rollScore = DiceBag.rollOneSequence(seq)
        if rollScore == 0:
            break
        else:
            score += rollScore
    acc += score
    #print(score, end=',')
averageScore = acc/countTo
print('Roll until \'0\' happend: average score is ' + str(averageScore))


for i in range(10):
    acc = 0
    score = 0
    while True:
        rollScore = DiceBag.rollOneSequence(seq)
        print(rollScore, end=',')
        if rollScore == 0:
            print()
            break
        else:
            score += rollScore
    acc += score
    if acc > 0:
        print('WIN: ' + str( acc ))
    elif acc == 0:
        print('NOT WIN, NOT LOOSE: ' + str( acc ))
    else:
        print('LOOSE: ' + str( acc ))
    print()