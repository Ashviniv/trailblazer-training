module User::Operation
  class Tasks < Trailblazer::Operation
    step :first_step
    fail :first_fail
    step :second_step
    fail :second_fail
    step :third_step
    
    def first_step
      p "First Step"
    end
   
    def second_step
      p "Second Step"
    end
   
    def third_step
      p "First Step"
    end
   
  end
end