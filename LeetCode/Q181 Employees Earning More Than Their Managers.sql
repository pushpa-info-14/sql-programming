select e.name as Employee from Employee e
inner join Employee em on e.managerId = em.Id
where e.salary > em.salary