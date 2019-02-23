# 8.1

def TripleStep(n):
    steps = {1: 1, 2: 2, 3: 4}

    if n in steps.keys():
        return steps[n]

    return TripleStep(n - 1) + TripleStep(n - 2) + TripleStep(n - 3)


def main():
    print(TripleStep(4))

main()