module AssignmentsHelper
    def assignment_for_select
        Assignment.chronological.collect { |a| [a.employee.first_name + " " + a.employee.last_name + ", " + a.store.name, a.id] }
    end
end

#<%= f.collection_select(:manufacturer_id, Manufacturer.all, :id, :name, :prompt => 'Select') %>