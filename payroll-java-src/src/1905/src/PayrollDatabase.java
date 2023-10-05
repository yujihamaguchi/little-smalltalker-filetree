import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

class PayrollDatabase {
	private static Map<Integer, Employee> itsEmployees = new HashMap<Integer, Employee>();
	private static Map<Integer, Employee> itsUnionMembers = new HashMap<Integer, Employee>();

	public static void AddEmployee(int empId, Employee e) {
		itsEmployees.put(empId, e);
	}

	public static Employee GetEmployee(int empId) {
		return itsEmployees.get(empId);
	}

	public static void Clear() {
		itsEmployees.clear();
		itsUnionMembers.clear();
	}

	public static void DeleteEmployee(int empId) {
		itsEmployees.remove(empId);
	}

	public static void AddUnionMember(int memberId, Employee e) {
		itsUnionMembers.put(memberId, e);
	}

	public static Employee GetUnionMember(int memberId) {
		return itsUnionMembers.get(memberId);
	}

	public static void RemoveUnionMember(int memberId) {
		itsUnionMembers.remove(memberId);
	}

	public static List<Integer> GetAllEmployeeIds() {
		return new ArrayList<Integer>(itsEmployees.keySet());
	}
}
