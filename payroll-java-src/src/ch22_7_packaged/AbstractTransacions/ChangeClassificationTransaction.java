package AbstractTransacions;

import PayrollDomain.Employee;
import PayrollDomain.PaymentClassification;
import PayrollDomain.PaymentSchedule;

public abstract class ChangeClassificationTransaction extends ChangeEmployeeTransaction {
	public ChangeClassificationTransaction(int empId) {
		super(empId);
	}

	public void Change(Employee e) {
		e.SetSchedule(GetSchedule());
		e.SetClassification(GetClassification());
	}

	public abstract PaymentSchedule GetSchedule();

	public abstract PaymentClassification GetClassification();
}
