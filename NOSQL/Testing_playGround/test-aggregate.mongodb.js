use('gisma_accomodation_test');

db.accommodation_comments.aggregate([
  
  {
    $group: {
      _id: "$accommodationId",
      averageReview: { $avg: "$review" },
      totalReviews: { $sum: 1 }
    }
  },


  {
    $sort: { averageReview: -1 }
  },


  {
    $limit: 1
  }
]);
