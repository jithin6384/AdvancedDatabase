use('gisma_accomodation_test');

    db.address.drop();
    db.accommodation_comments.drop;
    db.accommodation_visits.drop;
try{
    db.createCollection("address");
    db.createCollection("accommodation_comments");
    db.createCollection("accommodation_visits");
}catch (err) {
    console.log("error", err.message)
}
