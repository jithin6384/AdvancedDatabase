
use('gisma_accomodation_test');
const comments = [
    "This is a nice building.",
    "Not a good experience.",
    "Loved the neighborhood!",
    "Very clean and well maintained.",
    "Would not recommend.",
    "Spacious and bright rooms.",
    "A bit overpriced for the location.",
    "Friendly landlord and quiet area.",
    "Had some issues with heating.",
    "Would definitely stay again!"
  ];

  


db.address.insertMany([
    {accommodationId: 1,street: "Brunnenstrasse 12",city: "Berlin",postalCode: "10115",zone: "A",country: "Germany"},
    { accommodationId: 2,street: "Kaiserdamm 24",city: "Berlin",postalCode: "14057",zone: "B",country: "Germany"},
    { accommodationId: 3,street: "Friedrichstrasse 45",city: "Berlin", postalCode: "10969",zone: "A",country: "Germany"},
    { accommodationId: 4,street: "Leipziger Strasse 18",city: "Berlin",postalCode: "10117",zone: "A",country: "Germany"},
    {accommodationId: 5,street: "Kurfürstendamm 22",city: "Berlin",postalCode: "10719",zone: "B",country: "Germany"},
    { accommodationId: 6,street: "Potsdamer Strasse 99",city: "Berlin",postalCode: "10785",zone: "B",country: "Germany"},
    { accommodationId: 7,street: "Hauptstrasse 35",city: "Berlin",postalCode: "10827",zone: "C",country: "Germany"},
    {accommodationId: 8,street: "Frankfurter Allee 75",city: "Berlin",postalCode: "10247",zone: "B",country: "Germany"},
    {accommodationId: 9,street: "Schönhauser Allee 40",city: "Berlin",postalCode: "10435",zone: "A",country: "Germany"},
    {accommodationId: 10,street: "Karl-Marx-Strasse 19",city: "Berlin",postalCode: "12043",zone: "C",country: "Germany"}
  ])





  const user_ids = [2,4,5,6];   
  const accommodation_comment_docs =[]
  for (let i = 0; i < comments.length; i++) {
    accommodation_comment_docs.push({
        userId: user_ids[Math.floor(Math.random() * user_ids.length)],
        accommodationId: (i + 1),
        commentText: comments[i],
        review: Math.floor(Math.random() * 6 + 1),
        timestamp: new Date()
    });
   }

   db.accommodation_comments.insertMany(accommodation_comment_docs);
   const visit_tracker = [];
   for(let i = 0; i < 10; i ++){
      visit_tracker.push({
        accommodationId: i + 1,
        visitorCount: (Math.floor(Math.random() * 1000 + 1)),
        lastVisited: new Date()
      })
   }
  db.accommodation_visits.insertMany(visit_tracker);



  