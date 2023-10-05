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

	// List 19-19 [ChangeNameTransaction]
	public void testChangeNameTransaction() {
		System.err.println("TestChangeNameTransaction");
		int empId = 2;
		AddHourlyEmployee t = new AddHourlyEmployee(empId, "Bill", "Home", 15.25);
		t.Execute();
		ChangeNameTransaction cnt = new ChangeNameTransaction(empId, "Bob");
		cnt.Execute();
		Employee e = PayrollDatabase.GetEmployee(empId);
		assertNotNull(e);
		assertEquals("Bob", e.GetName());
	}

	// 19.4 Reader Exercise [ChangeAddressTransaction]
	public void testChangeAddressTransaction() {
		System.err.println("TestChangeAddressTransaction");
		int empId = 2;
		AddHourlyEmployee t = new AddHourlyEmployee(empId, "Bill", "Home", 15.25);
		t.Execute();
		ChangeAddressTransaction cat = new ChangeAddressTransaction(empId, "Second Home");
		cat.Execute();
		Employee e = PayrollDatabase.GetEmployee(empId);
		assertNotNull(e);
		assertEquals("Second Home", e.GetAddress());
	}

	// List 19-24 [ChangeHourlyTransaction]
	public void testChangeHourlyTransaction() {
		System.err.println("TestChangeHourlyTransaction");
		int empId = 3;
		AddCommissionedEmployee t = new AddCommissionedEmployee(empId, "Lance", "Home", 2500, 3.2);
		t.Execute();
		ChangeHourlyTransaction cht = new ChangeHourlyTransaction(empId, 27.52);
		cht.Execute();
		Employee e = PayrollDatabase.GetEmployee(empId);
		assertNotNull(e);
		PaymentClassification pc = e.GetClassification();
		assertNotNull(pc);
		HourlyClassification hc = (HourlyClassification) pc;
		assertNotNull(hc);
		assertEquals(27.52, hc.GetRate());
		PaymentSchedule ps = e.GetSchedule();
		WeeklySchedule ws = (WeeklySchedule) ps;
		assertNotNull(ws);
	}

	// 19.4 Reader Exercise [ChangeSalariedTransaction]
	public void testChangeSalariedTransaction() {
		System.err.println("TestChangeSalariedTransaction");
		int empId = 3;
		AddCommissionedEmployee t = new AddCommissionedEmployee(empId, "Lance", "Home", 2500, 3.2);
		t.Execute();
		ChangeSalariedTransaction cst = new ChangeSalariedTransaction(empId, 25000);
		cst.Execute();
		Employee e = PayrollDatabase.GetEmployee(empId);
		assertNotNull(e);
		PaymentClassification pc = e.GetClassification();
		assertNotNull(pc);
		SalariedClassification sc = (SalariedClassification) pc;
		assertNotNull(sc);
		assertEquals(25000.0, sc.GetSalary());
		PaymentSchedule ps = e.GetSchedule();
		MonthlySchedule ms = (MonthlySchedule) ps;
		assertNotNull(ms);
	}

	// 19.4 Reader Exercise [ChangeCommissionedTransaction]
	public void testChangeCommissionedTransaction() {
		System.err.println("TestChangeCommissionedTransaction");
		int empId = 2;
		AddHourlyEmployee t = new AddHourlyEmployee(empId, "Bill", "Home", 15.25);
		t.Execute();
		ChangeCommissionedTransaction cct = new ChangeCommissionedTransaction(empId, 25000, 4.5);
		cct.Execute();
		Employee e = PayrollDatabase.GetEmployee(empId);
		assertNotNull(e);
		PaymentClassification pc = e.GetClassification();
		assertNotNull(pc);
		CommissionedClassification cc = (CommissionedClassification) pc;
		assertNotNull(cc);
		assertEquals(25000.0, cc.GetSalary());
		assertEquals(4.5, cc.GetRate());
		PaymentSchedule ps = e.GetSchedule();
		BiweeklySchedule bs = (BiweeklySchedule) ps;
		assertNotNull(bs);
	}

	// 19.4 Reader Exercise [ChangeMailTransaction]
	public void testChangeMailTransaction() {
		System.err.println("TestChangeMailTransaction");
		int empId = 2;
		AddHourlyEmployee t = new AddHourlyEmployee(empId, "Bill", "Home", 15.25);
		t.Execute();
		ChangeMailTransaction cmt = new ChangeMailTransaction(empId, "4080 El Cerrito Road");
		cmt.Execute();
		Employee e = PayrollDatabase.GetEmployee(empId);
		assertNotNull(e);
		PaymentMethod pm = e.GetMethod();
		assertNotNull(pm);
		MailMethod mm = (MailMethod) pm;
		assertNotNull(mm);
		assertEquals("4080 El Cerrito Road", mm.GetAddress());
	}

	// 19.4 Reader Exercise [ChangeDirectTransaction]
	public void testChangeDirectTransaction() {
		System.err.println("TestChangeDirectTransaction");
		int empId = 2;
		AddHourlyEmployee t = new AddHourlyEmployee(empId, "Bill", "Home", 15.25);
		t.Execute();
		ChangeDirectTransaction cdt = new ChangeDirectTransaction(empId, "FirstNational", "1058209");
		cdt.Execute();
		Employee e = PayrollDatabase.GetEmployee(empId);
		assertNotNull(e);
		PaymentMethod pm = e.GetMethod();
		assertNotNull(pm);
		DirectMethod dm = (DirectMethod) pm;
		assertNotNull(dm);
		assertEquals("FirstNational", dm.GetBank());
		assertEquals("1058209", dm.GetAccount());
	}

	// 19.4 Reader Exercise [ChangeHoldTransaction]
	public void testChangeHoldTransaction() {
		System.err.println("TestChangeHoldTransaction");
		int empId = 2;
		AddHourlyEmployee t = new AddHourlyEmployee(empId, "Bill", "Home", 15.25);
		t.Execute();
		ChangeHoldTransaction cht = new ChangeHoldTransaction(empId);
		cht.Execute();
		Employee e = PayrollDatabase.GetEmployee(empId);
		assertNotNull(e);
		PaymentMethod pm = e.GetMethod();
		assertNotNull(pm);
		HoldMethod hm = (HoldMethod) pm;
		assertNotNull(hm);
	}

	// List 19-29 [ChangeMemberTransaction]
	public void testChangeMemberTransaction() {
		System.err.println("TestChangeMemberTransaction");
		int empId = 2;
		int memberId = 7734;
		AddHourlyEmployee t = new AddHourlyEmployee(empId, "Bill", "Home", 15.25);
		t.Execute();
		ChangeMemberTransaction cmt = new ChangeMemberTransaction(empId, memberId, 99.42);
		cmt.Execute();
		Employee e = PayrollDatabase.GetEmployee(empId);
		assertNotNull(e);
		Affiliation af = e.GetAffiliation();
		assertNotNull(af);
		UnionAffiliation uf = (UnionAffiliation) af;
		assertNotNull(uf);
		assertEquals(99.42, uf.GetDues());
		Employee member = PayrollDatabase.GetUnionMember(memberId);
		assertNotNull(member);
		assertEquals(e, member);
	}
}
