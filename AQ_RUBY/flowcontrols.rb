=begin
#next statement
for i in 0..10

    if i==7     
        next
    end

    puts i
end

#redo statement
for i in 1..10

    if i==7 then
        redo
    end
    puts i
end

#break statement
for i in 0..10

    if i==7     
        break
    end
    puts i

end
=end