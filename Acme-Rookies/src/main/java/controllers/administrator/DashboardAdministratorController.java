
package controllers.administrator;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.AdministratorService;
import services.ApplicationService;
import services.AuditService;
import services.CompanyService;
import services.ItemService;
import services.PositionService;
import services.ProviderService;
import services.RookieService;
import controllers.AbstractController;
import domain.Company;
import domain.Position;
import domain.Provider;
import domain.Rookie;

@Controller
@RequestMapping("/dashboard/administrator")
public class DashboardAdministratorController extends AbstractController {

	// Services

	@Autowired
	private RookieService		rookieService;

	@Autowired
	private CompanyService		companyService;

	@Autowired
	private PositionService		positionService;

	@Autowired
	private ApplicationService applicationService;
	
	@Autowired
	private AuditService auditService;

	@Autowired
	private AdministratorService administratorService;

	@Autowired
	private ItemService			itemService;

	@Autowired
	private ProviderService		providerService;


	// Display

	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ModelAndView display() {
		final ModelAndView result;
		final Double avgPositionsPerCompany, minPositionsPerCompany, maxPositionsPerCompany, stddevPositionsPerCompany;
		final Double avgApplicationsPerRookie, minApplicationsPerRookie, maxApplicationsPerRookie, stddevApplicationsPerRookie;

		final Collection<Company> companiesWithMorePositions;
		final Collection<Rookie> rookiesWithMoreApplications;
		final Collection<Provider> topFiveProvidersInItems;

		final Double avgSalariesOffered, minSalariesOffered, maxSalariesOffered, stddevSalariesOffered, avgItemsPerProvider, minItemsPerProvider, maxItemsPerProvider, stddevItemsPerProvider;

		final Position bestSalaryPosition;
		final Position worstSalaryPosition;
		
		final Double avgScoreAuditPosition, minScoreAuditPosition, maxScoreAuditPosition, stddevScoreAuditPosition;
		
		final Double avgScoreAuditCompany, minScoreAuditCompany, maxScoreAuditCompany, stddevScoreAuditCompany;
		
		final Double avgSalaryPositionsHighestAvgScore;
		
		final Collection<Company> bestScoreCompanies;
		// Stadistics

		// avg
		avgPositionsPerCompany = this.positionService.avgPositionsPerCompany();

		// min
		minPositionsPerCompany = this.positionService.minPositionsPerCompany();

		// max
		maxPositionsPerCompany = this.positionService.maxPositionsPerCompany();

		// standard Deviation
		stddevPositionsPerCompany = this.positionService.stddevPositionsPerCompany();

		// avg
		avgApplicationsPerRookie = this.applicationService.avgApplicationsPerRookie();

		// min
		minApplicationsPerRookie = this.applicationService.minApplicationsPerRookie();

		// max
		maxApplicationsPerRookie = this.applicationService.maxApplicationsPerRookie();

		// standard Deviation
		stddevApplicationsPerRookie = this.applicationService.stddevApplicationsPerRookie();

		companiesWithMorePositions = this.companyService.companiesWithMorePositions();

		rookiesWithMoreApplications = this.rookieService.rookiesWithMoreApplications();

		// avg
		avgSalariesOffered = this.positionService.avgSalariesOffered();

		// min
		minSalariesOffered = this.positionService.minSalariesOffered();

		// max
		maxSalariesOffered = this.positionService.maxSalariesOffered();

		// standard Deviation
		stddevSalariesOffered = this.positionService.stddevSalariesOffered();

		bestSalaryPosition = this.positionService.bestSalaryPosition();
		worstSalaryPosition = this.positionService.worstSalaryPosition();
		
		//Audit
		//min
		minScoreAuditPosition = this.auditService.minAuditScorePosition();
		//max
		maxScoreAuditPosition = this.auditService.maxAuditScorePosition();
		//avg
		avgScoreAuditPosition = this.auditService.avgAuditScorePosition();
		//stdev
		stddevScoreAuditPosition = this.auditService.stddevAuditScorePosition();
		//min
		minScoreAuditCompany = this.auditService.minAuditScoreCompany();
		//max
		maxScoreAuditCompany = this.auditService.maxAuditScoreCompany();
		//avg
		avgScoreAuditCompany = this.auditService.avgAuditScoreCompany();
		//stdev
		stddevScoreAuditCompany = this.auditService.stddevAuditScoreCompany();
		//
		avgSalaryPositionsHighestAvgScore = this.auditService.avgSalaryPositionsHighestAvgScore();
		
		bestScoreCompanies = this.auditService.bestScoreCompanies();
		//

		// avg
		avgItemsPerProvider = this.itemService.avgItemsPerProvider();

		// min
		minItemsPerProvider = this.itemService.minItemsPerProvider();

		// max
		maxItemsPerProvider = this.itemService.maxItemsPerProvider();

		// standard Deviation
		stddevItemsPerProvider = this.itemService.stddevItemsPerProvider();

		// Top-5 providers of total number of items

		topFiveProvidersInItems = this.providerService.topFiveProvidersInItems();

		result = new ModelAndView("administrator/dashboard");
		result.addObject("avgPositionsPerCompany", avgPositionsPerCompany);
		result.addObject("minPositionsPerCompany", minPositionsPerCompany);
		result.addObject("maxPositionsPerCompany", maxPositionsPerCompany);
		result.addObject("stddevPositionsPerCompany", stddevPositionsPerCompany);

		result.addObject("avgApplicationsPerRookie", avgApplicationsPerRookie);
		result.addObject("minApplicationsPerRookie", minApplicationsPerRookie);
		result.addObject("maxApplicationsPerRookie", maxApplicationsPerRookie);
		result.addObject("stddevApplicationsPerRookie", stddevApplicationsPerRookie);

		result.addObject("companiesWithMorePositions", companiesWithMorePositions);

		result.addObject("rookiessWithMoreApplications", rookiesWithMoreApplications);

		result.addObject("avgSalariesOffered", avgSalariesOffered);
		result.addObject("minSalariesOffered", minSalariesOffered);
		result.addObject("maxSalariesOffered", maxSalariesOffered);
		result.addObject("stddevSalariesOffered", stddevSalariesOffered);

		result.addObject("bestSalaryPosition", bestSalaryPosition);
		result.addObject("worstSalaryPosition", worstSalaryPosition);

		result.addObject("minScoreAuditPosition", minScoreAuditPosition);
		result.addObject("maxScoreAuditPosition", maxScoreAuditPosition);
		result.addObject("avgScoreAuditPosition", avgScoreAuditPosition);
		result.addObject("stddevScoreAuditPosition", stddevScoreAuditPosition);

		result.addObject("minScoreAuditCompany", minScoreAuditCompany);
		result.addObject("maxScoreAuditCompany", maxScoreAuditCompany);
		result.addObject("avgScoreAuditCompany", avgScoreAuditCompany);
		result.addObject("stddevScoreAuditCompany", stddevScoreAuditCompany);
		
		result.addObject("avgSalaryPositionsHighestAvgScore", avgSalaryPositionsHighestAvgScore);
		result.addObject("bestScoreCompanies", bestScoreCompanies);		

		result.addObject("avgItemsPerProvider", avgItemsPerProvider);
		result.addObject("minItemsPerProvider", minItemsPerProvider);
		result.addObject("maxItemsPerProvider", maxItemsPerProvider);
		result.addObject("stddevItemsPerProvider", stddevItemsPerProvider);

		result.addObject("topFiveProvidersInItems", topFiveProvidersInItems);

		return result;

	}
	@RequestMapping(value = "/display", method = RequestMethod.GET, params ="computeScore")
	public ModelAndView computeScore(){
		final ModelAndView result;
		
		this.administratorService.computeScore();
		
		result = new ModelAndView("redirect:display.do");
		
		return result;
	}

}
