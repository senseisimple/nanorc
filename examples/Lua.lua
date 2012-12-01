function main(...)
    -- Boolean, multiple assignment
    local yes, no = true, false

    -- Numbers
    local num, hex = 102.224e-11, 0xbada55

    -- Table constructor, vararg, nil
    local tab = {..., "One", "Two", "Three", key="Value", nil}

    -- Multiple return, table access
    return yes, hex, tab.key, tab[1]
end

-- Function call, optional parentheses
print(main "Hello World")
