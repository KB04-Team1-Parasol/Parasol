package kbits.kb04.parasol.silver.service;

import org.springframework.data.jpa.domain.Specification;

import kbits.kb04.parasol.silver.entity.SilverTownDetail;

public class SilverTownDetailSpecification {
	public static Specification<SilverTownDetail> equalStdOccupancy(Integer stdOccupancy) {
		return (root, query, criteriaBuilder) -> criteriaBuilder.equal(root.get("stdOccupancy"), stdOccupancy);
	}

	public static Specification<SilverTownDetail> findLessDeposit(Integer stdDeposit) {
		return (root, query, criteriaBuilder) -> criteriaBuilder.between(root.get("stdDeposit"), 0, stdDeposit);
	}

	public static Specification<SilverTownDetail> findLessMonthlyCost(Integer stdMonthlyCost) {
		return (root, query, criteriaBuilder) -> criteriaBuilder.between(root.get("stdMonthlyCost"), 0, stdMonthlyCost);
	}

	public static Specification<SilverTownDetail> findLessRoomSize(Integer stdRoomSize) {
		return (root, query, criteriaBuilder) -> criteriaBuilder.between(root.get("stdRoomSize"), 0, stdRoomSize);
	}

	public static Specification<SilverTownDetail> equalStType(Integer stType) {
		return (root, query, criteriaBuilder) -> criteriaBuilder.equal(root.get("silverTown").get("stType"), stType);
	}

	public static Specification<SilverTownDetail> findLessStPeriod(Integer stPeriod) {
		return (root, query, criteriaBuilder) -> criteriaBuilder.between(root.get("silverTown").get("stPeriod"), 0,
				stPeriod);
	}

	public static Specification<SilverTownDetail> equalStName(String stName) {
		return (root, query, criteriaBuilder) -> criteriaBuilder.like(root.get("silverTown").get("stName"),
				"%" + stName + "%");
	}

	public static Specification<SilverTownDetail> equalCity(String city) {
		return (root, query, criteriaBuilder) -> criteriaBuilder.like(root.get("silverTown").get("city"),
				"%" + city + "%");
	}

	public static Specification<SilverTownDetail> equalStScale(Integer stScale) {
		return (root, query, criteriaBuilder) -> criteriaBuilder.equal(root.get("silverTown").get("stScale"), stScale);
	}
}
