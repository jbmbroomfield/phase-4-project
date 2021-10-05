module ApplicationHelper

    def row_class(index, total)
        parity = index % 2 == 0 ? ' row-even' : ' row-odd'
        first = index == 0 ? ' row-first' : ''
        last = index == total - 1 ? ' row-last' : ''
        "row#{parity}#{first}#{last}"
    end

end
