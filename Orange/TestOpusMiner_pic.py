import sys
import os
sys.path.insert(0, os.path.dirname(os.path.dirname(os.getcwd())))
from opusminer.OpusMiner import *
import pandas as pd


def main():

    data = pd.DataFrame([line.strip().split(',') for line in open('data_categorielle_opus.csv', 'r')]).fillna('').replace(' ', '',
                                                                                                             regex=True)
    opus = OpusMiner(k=100, search_by_lift=False,
                     input_data=data, market_basket=True)

    associations = opus.fit()

    print("Alpha list: \n")

    for i in range(len(associations.alpha)):
        print(str(associations.alpha[i]) + "\n")

    if associations.ssi:
        print("Self sufficient itemsets: \n")
        for i in range(len(associations.ssi)):
            [support_count, value, p_value, itemset_str, closure_str] = associations.ssi[i]
            # the closure list is not available in this sample
            print(itemset_str + ", rule size: " + str(support_count) +
                  ", value: " + str(value) + ", p-value: " + str(p_value))

    if associations.nssi:
        print("Non Self sufficient itemsets: \n")
        for i in range(len(associations.nssi)):
            [support_count, value, p_value, itemset_str, closure_str] = associations.nssi[i]
            print(itemset_str + ", rule size: " + str(support_count) +
                  ", value: " + str(value) + ", p-value: " + str(p_value))


def clear_all():
    """Clears all the variables from the workspace of the spyder application."""
    gl = globals().copy()
    for var in gl:
        if var[0] == '_': continue
        if 'func' in str(globals()[var]): continue
        if 'module' in str(globals()[var]): continue

        del globals()[var]


if __name__ == "__main__":
    # clear_all()
    main()
