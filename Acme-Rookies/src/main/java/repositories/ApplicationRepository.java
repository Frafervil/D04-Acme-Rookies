
package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Application;

@Repository
public interface ApplicationRepository extends JpaRepository<Application, Integer> {

	@Query("select a from Application a where a.position.id = ?1")
	Collection<Application> findAllByPositionId(int positionId);

	@Query("select a from Application a where a.problem.id = ?1")
	Collection<Application> findAllByProblemId(int problemId);

	@Query("select a from Application a join a.position p where p.company.id = ?1")
	Collection<Application> findAllByCompany(int companyId);

	@Query("select avg(1.0*(select count(a) from Application a where a.rookie.id = h.id)) from Rookie h")
	Double avgApplicationsPerRookie();

	@Query("select min(1.0*(select count(a) from Application a where a.rookie.id = h.id)) from Rookie h")
	Double minApplicationsPerRookie();

	@Query("select max(1.0*(select count(a) from Application a where a.rookie.id = h.id)) from Rookie h")
	Double maxApplicationsPerRookie();

	@Query("select stddev(1.0*(select count(a) from Application a where a.rookie.id = h.id)) from Rookie h")
	Double stddevApplicationsPerRookie();
	@Query("select a from Application a where a.rookie.id = ?1")
	Collection<Application> findAllApplicationsByRookieId(int rookieId);

}
