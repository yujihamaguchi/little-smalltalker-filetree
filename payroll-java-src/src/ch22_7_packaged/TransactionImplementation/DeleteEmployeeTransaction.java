package TransactionImplementation;

import PayrollDatabase.GlobalDatabase;
import TransactionApplication.Transaction;

public class DeleteEmployeeTransaction implements Transaction {
	private int itsEmpId;

	public DeleteEmployeeTransaction(int empId) {
		itsEmpId = empId;
	}

	public void Execute() {
		GlobalDatabase.payrollDB.DeleteEmployee(itsEmpId);
	}
}
