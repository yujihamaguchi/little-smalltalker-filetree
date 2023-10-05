import junit.framework.TestCase;

public class TestPayroll extends TestCase {
	// List 19-2 [AddSalariedEmployee]
	public void testAddSalariedEmployee() {
		System.err.println("TestAddSalariedEmployee");
		int empId = 1;
		AddSalariedEmployee t = new AddSalariedEmployee(empId, "Bob", "Home", 1000.00);
		t.Execute();
		Employee e = PayrollDatabase.GetEmployee(empId);
		assertNotNull(e);
		assertEquals("Bob", e.GetName());
		PaymentClassification pc = e.GetClassification();
		SalariedClassification sc = (SalariedClassification) pc;
		assertNotNull(sc);
		assertEquals(1000.00, sc.GetSalary());
		PaymentSchedule ps = e.GetSchedule();
		MonthlySchedule ms = (MonthlySchedule) ps;
		assertNotNull(ms);
		PaymentMethod pm = e.GetMethod();
		HoldMethod hm = (HoldMethod) pm;
		assertNotNull(hm);
	}

	// 19.1 Reader Exercise [AddHourlyEmployee]
	public void testAddHourlyEmployee() {
		System.err.println("TestAddHourlyEmployee");
		int empId = 2;
		AddHourlyEmployee t = new AddHourlyEmployee(empId, "Bill", "Home", 15.25);
		t.Execute();
		Employee e = PayrollDatabase.GetEmployee(empId);
		assertNotNull(e);
		assertEquals("Bill", e.GetName());
		PaymentClassification pc = e.GetClassification();
		HourlyClassification hc = (HourlyClassification) pc;
		assertNotNull(hc);
		assertEquals(15.25, hc.GetRate());
		PaymentSchedule ps = e.GetSchedule();
		WeeklySchedule ws = (WeeklySchedule) ps;
		assertNotNull(ws);
		PaymentMethod pm = e.GetMethod();
		HoldMethod hm = (HoldMethod) pm;
		assertNotNull(hm);
	}

	// 19.1 Reader Exercise [AddCommissionedEmployee]
	public void testAddCommissionedEmployee() {
		System.err.println("TestAddCommissionedEmployee");
		int empId = 1;
		AddCommissionedEmployee t = new AddCommissionedEmployee(empId, "Lance", "Home", 2500.0, 3.2);
		t.Execute();
		Employee e = PayrollDatabase.GetEmployee(empId);
		assertNotNull(e);
		assertEquals("Lance", e.GetName());
		PaymentClassification pc = e.GetClassification();
		CommissionedClassification cc = (CommissionedClassification) pc;
		assertNotNull(cc);
		assertEquals(2500.0, cc.GetSalary());
		PaymentSchedule ps = e.GetSchedule();
		BiweeklySchedule bs = (BiweeklySchedule) ps;
		assertNotNull(bs);
		PaymentMethod pm = e.GetMethod();
		HoldMethod hm = (HoldMethod) pm;
		assertNotNull(hm);
	}

	// List 19-9 [DeleteEmployee]
	public void testDeleteEmployee() {
		System.err.println("TestDeleteEmployee");
		int empId = 3;
		AddCommissionedEmployee t = new AddCommissionedEmployee(empId, "Lance", "Home", 2500, 3.2);
		t.Execute();
		Employee e = PayrollDatabase.GetEmployee(empId);
		assertNotNull(e);
		DeleteEmployeeTransaction dt = new DeleteEmployeeTransaction(empId);
		dt.Execute();
		e = PayrollDatabase.GetEmployee(empId);
		assertNull(e);
	}

	// List 19-12 [TimeCardTransaction]
	public void testTimeCardTransaction() {
		System.err.println("TestTimeCardTransaction");
		int empId = 2;
		AddHourlyEmployee t = new AddHourlyEmployee(empId, "Bill", "Home", 15.25);
		t.Execute();
		TimeCardTransaction tct = new TimeCardTransaction(20011031, 8.0, empId);
		tct.Execute();
		Employee e = PayrollDatabase.GetEmployee(empId);
		assertNotNull(e);
		PaymentClassification pc = e.GetClassification();
		HourlyClassification hc = (HourlyClassification) pc;
		assertNotNull(hc);
		TimeCard tc = hc.GetTimeCard(20011031);
		assertNotNull(tc);
		assertEquals(8.0, tc.GetHours());
	}

	// 19.3 Reader Exercise [SalesReceiptTransaction]
	public void testSalesReceiptTransaction() {
		System.err.println("TestSalesReceiptTransaction");
		int empId = 3;
		AddCommissionedEmployee t = new AddCommissionedEmployee(empId, "Lance", "Home", 2500, 3.2);
		t.Execute();
		SalesReceiptTransaction srt = new SalesReceiptTransaction(20011112, 25000, empId);
		srt.Execute();
		Employee e = PayrollDatabase.GetEmployee(empId);
		assertNotNull(e);
		PaymentClassification pc = e.GetClassification();
		CommissionedClassification cc = (CommissionedClassification) pc;
		assertNotNull(cc);
		SalesReceipt receipt = cc.GetReceipt(20011112);
		assertNotNull(receipt);
		assertEquals(25000.0, receipt.GetAmount());
	}

	// List 19-16 [AddServiceCharge]
	public void testAddServiceCharge() {
		System.err.println("TestAddServiceCharge");
		int empId = 2;
		AddHourlyEmployee t = new AddHourlyEmployee(empId, "Bill", "Home", 15.25);
		t.Execute();
		TimeCardTransaction tct = new TimeCardTransaction(20011031, 8.0, empId);
		tct.Execute();
		Employee e = PayrollDatabase.GetEmployee(empId);
		assertNotNull(e);
		Affiliation af = new UnionAffiliation(12.5);
		e.SetAffiliation(af);
		int memberId = 86;
		PayrollDatabase.AddUnionMember(memberId, e);
		ServiceChargeTransaction sct = new ServiceChargeTransaction(memberId, 20011031, 12.95);
		sct.Execute();
		double sc = af.GetServiceCharge(20011031);
		assertEquals(12.95, sc, .001);
	}
}
