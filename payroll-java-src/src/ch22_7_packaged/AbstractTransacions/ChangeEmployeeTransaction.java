package AbstractTransacions;

import PayrollDatabase.GlobalDatabase;
import PayrollDomain.Employee;
import TransactionApplication.Transaction;

public abstract class ChangeEmployeeTransaction implements Transaction {
	private int itsEmpId;

	public ChangeEmployeeTransaction(int empId) {
		itsEmpId = empId;
	}

	public void Execute() {
		Employee e = GlobalDatabase.payrollDB.GetEmployee(itsEmpId);
		if (e != null) {
			Change(e);
		}
	}

	public abstract void Change(Employee e);
}
