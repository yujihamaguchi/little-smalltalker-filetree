package AbstractTransacions;

import PayrollDomain.Affiliation;
import PayrollDomain.Employee;

public abstract class ChangeAffiliationTransaction extends ChangeEmployeeTransaction {
	public ChangeAffiliationTransaction(int empId) {
		super(empId);
	}

	public void Change(Employee e) {
		RecordMembership(e);
		e.SetAffiliation(GetAffiliation());
	}

	public abstract void RecordMembership(Employee e);

	public abstract Affiliation GetAffiliation();
}
