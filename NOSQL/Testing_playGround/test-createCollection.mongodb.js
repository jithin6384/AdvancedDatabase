use('gisma_accomodation_test');
if (db.getCollectionNames().includes("address")) {
    db.address.drop();
}
if (db.getCollectionNames().includes("accommodation_comments")) {
    db.accommodation_comments.drop();
}

if (db.getCollectionNames().includes("accommodation_visits")) {
    db.accommodation_visits.drop();
}
   
try{
    db.createCollection("address");
    db.createCollection("accommodation_comments");
    db.createCollection("accommodation_visits");
}catch (err) {
    console.log("error", err.message)
}
