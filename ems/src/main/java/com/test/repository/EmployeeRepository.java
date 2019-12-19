package com.test.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.test.entity.Employee;

public interface EmployeeRepository extends JpaRepository<Employee, Long> {
	
	Employee save(Employee employee);
	
	List<Employee> findAll();
	
	void deleteById(Long id);
	
}
