class Employee 
    attr_reader :salary, :name
    def initialize(name,title,salary,boss=nil)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        self.salary * multiplier
    end

    def boss=(boss)
        @boss = boss
        boss.add_employee(self) 
    end
end

class Manager < Employee
    attr_reader :employees
    def initialize(name,title,salary,boss=nil) #employees == []
        super(name,title,salary,boss)
        @employees = []
    end

    def bonus(multiplier)
        # total = 0
        # employees.each do |emp|
        #     if emp.is_a(Manager)
        #         if emp.employees.length == 0  
        #             total += emp.salary 
        #         end
        #     else
        #         total += emp.salary
        #     end
        # end
        self.total_salary * multiplier 
    end

    def total_salary
        total = 0
        employees.each do |emp|
            if emp.is_a?(Manager) #forget ? after is_a sorry
                total = emp.salary + emp.total_salary 
            else
                total += emp.salary
            end
        end
        return total 
    end

    def add_employee(employee)
        employees << employee if !employees.include?(employee)
    end
end

