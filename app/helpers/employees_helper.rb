module EmployeesHelper

	def employee_job_name(employee)
		if employee.is_a? Cooker
			"Cuisto"
		elsif employee.is_a? Waiter
			"Serveur"
		else
			"Autre"
		end
	end

	def user_is_an_employee?(user)
		user.is_a?(Cooker) || user.is_a?(Waiter)
	end

end
