class Array
    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end
        self
    end

    def my_select(&prc)
        new_array = []
        self.my_each { |ele| new_array << ele if prc.call(ele)}
        # i = 0
        # while i < self.length
        #     new_array << self[i] if self.my_each(&prc)
        #     i += 1
        # end
        new_array
    end

    def my_reject(&prc)
        new_array = []
        self.my_each { |ele| new_array << ele if !prc.call(ele)}
        new_array
    end

    def my_any?(&prc)
        self.my_each { |ele| return true if prc.call(ele)}
        false
    end

    def my_all?(&prc)
        self.my_each { |ele| return false if !prc.call(ele)}
        true
    end

    def my_flatten
        new_array = []

        self.each do |ele|
            if !ele.is_a?(Array)
                new_array << ele
            else
                new_array += ele.my_flatten
            end
        end

        new_array
    end

    def my_zip(*args)
        new_array = Array.new(self.length) { Array.new()}
        self.each_with_index do |ele_1, i|
            new_array[i] << ele_1
            args.each do |ele_2|
                new_array[i] << ele_2[i]
            end
        end
        new_array
    end

    def my_rotate(value = 1)
        new_array = []
        new_value = value % self.length
        (new_value...self.length).each { |i| new_array << self[i]}
        (0...new_value).each { |i| new_array << self[i] }
        new_array
    end

    def my_join(str = "")
        string = ""
        self.each_with_index do |ele, i|
            if i != self.length - 1 
                string += ele + str 
            else
                string += ele
            end
        end
        string
    end

    def my_reverse
        new_array = []
        (-(self.length)..-1).each do |i|
            new_array.unshift(self[i])
        end
        new_array
    end
end

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)

# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten

# return_value = [1, 2, 3].my_each do |num|
#     puts num
#    end.my_each do |num|
#     puts num
#    end

# p return_value

# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []

# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]

# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"

# p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# p [ 1 ].my_reverse               #=> [1]