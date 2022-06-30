package com.mybatis.join.vo;

import org.springframework.stereotype.Component;

@Component
public class JoinVO2 {
	
	private EmployeesVO emps; 
	private DepartmentsVO depts;
	private LocationsVO locs;
	private Job_HistoryVO j_h;
	
	public JoinVO2 () {}
	
	public EmployeesVO getEmps() {
		return emps;
	}

	public void setEmps(EmployeesVO emps) {
		this.emps = emps;
	}

	public DepartmentsVO getDepts() {
		return depts;
	}

	public void setDepts(DepartmentsVO depts) {
		this.depts = depts;
	}

	public LocationsVO getLocs() {
		return locs;
	}

	public void setLocs(LocationsVO locs) {
		this.locs = locs;
	}

	public Job_HistoryVO getJ_h() {
		return j_h;
	}

	public void setJ_h(Job_HistoryVO j_h) {
		this.j_h = j_h;
	}

	@Override
	public String toString() {
		return "JoinVO2 [emps=" + emps + ", depts=" + depts + ", locs=" + locs + ", j_h=" + j_h + "]";
	}

	
	
	
	
}
