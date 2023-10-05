import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PaydayTransaction implements Transaction {
	private Calendar itsPayDate;
	private Map<Integer, Paycheck> itsPaychecks = new HashMap<Integer, Paycheck>();

	public PaydayTransaction(Calendar payDate) {
		itsPayDate = payDate;
	}

	public void Execute() {
		List<Integer> empIds = PayrollDatabase.GetAllEmployeeIds();
		for (int empId : empIds) {
			Employee e = PayrollDatabase.GetEmployee(empId);
			if (e.IsPayDate(itsPayDate)) {
				Paycheck pc = new Paycheck(e.GetPayPeriodStartDate(itsPayDate), itsPayDate);
				itsPaychecks.put(empId, pc);
				e.Payday(pc);
			}
		}
	}

	public Paycheck GetPaycheck(int empId) {
		return itsPaychecks.get(empId);
	}
}
