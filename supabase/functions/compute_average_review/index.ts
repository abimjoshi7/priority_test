import { initializeApp, FirebaseOptions } from "https://www.gstatic.com/firebasejs/10.11.1/firebase-app.js";
import { getFirestore, collection, getDocs } from "https://www.gstatic.com/firebasejs/10.11.1/firebase-firestore.js";

const firebaseConfig: FirebaseOptions = {
  apiKey: "AIzaSyDBIBhjXZTiaJqeI3PlxhYKN7-3_i2wKJA",
  authDomain: "prioritytest-dbaea.firebaseapp.com",
  projectId: "prioritytest-dbaea",
  storageBucket: "prioritytest-dbaea.appspot.com",
  messagingSenderId: "617595951667",
  appId: "1:617595951667:web:5b62d9cef3a708ef2a2146"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const db = getFirestore(app);

Deno.serve(async (req) => {
  const { productId } = await req.json();

  const reviewsRef = collection(db, 'reviews');
  const reviewsSnapshot = await getDocs(reviewsRef);

  const reviewsData = reviewsSnapshot.docs.map(doc => doc.data());
  const filteredReviews = reviewsData.filter(review => review.productId === parseInt(productId));

  const data: Data = {
    productId: productId,
    reviews: filteredReviews,
  };

  const averageReview: number = computeAverageReview(data);

  return new Response(
    JSON.stringify({
      "data": averageReview
    }),
    { headers: { "Content-Type": "application/json" } },
  );
});

interface Review {
  createdDate?: string;
  productId: number;
  userId: number;
  comment: string;
  rating: number;
}

interface Data {
  productId: string;
  reviews: Review[];
}

function computeAverageReview(data: Data): number {
  const reviews = data.reviews;
  if (reviews.length === 0) return 0; // Handle case where there are no reviews
  let sum = 0;
  for (let i = 0; i < reviews.length; i++) {
    sum += reviews[i].rating;
  }
  const averageRating = sum / reviews.length;
  return averageRating;
}

/*
curl -X POST https://pbwxtxxroyigoqzasepb.supabase.co/functions/v1/compute_average_review \
-H "Content-Type: application/json" \
-H 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBid3h0eHhyb3lpZ29xemFzZXBiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTU1ODA0MTAsImV4cCI6MjAzMTE1NjQxMH0.0tUVeUZggZ24vuhUiUuywziBRF1026lP1HtTDlPnDpc' \
-d '{"productId": 1}'
*/