def order_food(lst): 
    # your code here
    options_count={}
    for developer in lst:
        food_option = developer.get('meal')
        if food_option in options_count:
            options_count[food_option] += 1
        else:
            options_count[food_option] = 1

    # Return the dictionary containing the count of each food option
    return options_count
    pass
