use('gisma_accomodation_systems');

db.accommodation_comments.aggregate([
  // Stage 1: Group by accommodationId and calculate average review
  {
    $group: {
      _id: "$accommodationId",
      averageReview: { $avg: "$review" },
      totalReviews: { $sum: 1 }
    }
  },

  // Stage 2: Sort by average review (descending)
  {
    $sort: { averageReview: -1 }
  },

  // Stage 3: Limit to top 1
  {
    $limit: 1
  }
]);


///delete examples

// Example 1: Delete comments with rating 1
db.accommodation_comments.deleteMany({ review: 1 });

// Example 2: Delete visits older than a certain date
db.accommodation_visits.deleteMany({
  lastVisited: { $lt: new Date("2023-01-01") }
});

// Example 3: Remove accommodations in zone 'C'
db.address.deleteMany({ zone: "C" });