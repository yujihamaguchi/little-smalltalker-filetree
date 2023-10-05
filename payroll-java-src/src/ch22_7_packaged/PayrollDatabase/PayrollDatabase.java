package PayrollDatabase;

import java.util.List;

import PayrollDomain.Employee;

public interface PayrollDatabase {
	public void AddEmployee(int empId, Employee e);

	public Employee GetEmployee(int empId);

	public void Clear();

	public void DeleteEmployee(int empId);

	public void AddUnionMember(int memberId, Employee e);

	public Employee GetUnionMember(int memberId);

	public void RemoveUnionMember(int memberId);

	public List<Integer> GetAllEmployeeIds();
}
