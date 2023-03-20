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
end

# return_value = [1, 2, 3].my_each do |num|
#     puts num
#    end.my_each do |num|
#     puts num
#    end

# p return_value

# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []

a = [1, 2, 3]
p a.my_reject { |num| num > 1 } # => [1]
p a.my_reject { |num| num == 4 } # => [1, 2, 3]
