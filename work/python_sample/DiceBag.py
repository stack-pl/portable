import secrets

def rollOneSequence(sequence):
    return secrets.choice(sequence)

def rollManySequences(setOfSequences):
    result = []
    for sequence in setOfSequences:
        result.append(rollOneSequence(sequence))
    return result

def roll_dice(n, modifier=0):
    return 1 + secrets.randbelow(n) + modifier

def roll_dices(n, quantity=1, modifier=0):
    result = []
    for score in range(quantity):
        result.append(roll_dice(n, modifier))
    return result