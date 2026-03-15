import SwiftUI

struct NewsCard: View {
    let headline: String

    var body: some View {
        HStack(alignment: .center, spacing: 12) {

            // Left Image
            AsyncImage(url: URL(string: "https://img.freepik.com/free-photo/type-entertainment-complex-popular-resort-with-pools-water-parks-turkey-with-more-than-5-million-visitors-year-amara-dolce-vita-luxury-hotel-resort-tekirova-kemer_146671-18728.jpg?semt=ais_hybrid&w=740&q=80")) {
                image in
                image
                    .resizable()
                    .scaledToFill() // ← changed from scaledToFit
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            } placeholder: {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(.systemGray5))
                    .overlay(ProgressView())
                    .frame(width: 100, height: 100)
            }
            .frame(width: 100, height: 100) // ← fixes AsyncImage sizing

            // Right VStack
            VStack(alignment: .leading, spacing: 6) {

                Text("Sports")
                    .font(.caption)
                    .fontWeight(.regular)
                    .foregroundColor(.black)
                    .textCase(.uppercase)

                Text(headline)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .lineLimit(2)

                HStack(spacing: 4) {
                    AsyncImage(url: URL(string: "https://w-hotels.marriott.com/wp-content/uploads/2025/08/Punta-Cana-hero-m.jpg")) {
                        image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 15, height: 15)
                            .clipShape(Circle())
                    } placeholder: {
                        Circle()
                            .fill(Color(.systemGray5))
                            .frame(width: 15, height: 15)
                    }
                    .frame(width: 15, height: 15) // ← fixes small AsyncImage sizing

                    Text("BBC News")
                        .font(.caption)
                        .foregroundColor(.gray)

                    Image(systemName: "clock")
                        .font(.system(size: 12))
                        .foregroundColor(.black)

                    Text("14 min ago")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(12) // ← this was missing, causes card to show content
        .frame(maxWidth: .infinity)
        .background(Color.gray.opacity(0.01))
        .cornerRadius(14).overlay( // ← add this
            RoundedRectangle(cornerRadius: 14)
                .stroke(Color.gray.opacity(0.2), lineWidth: 0.5))
    }
}

#Preview {
    NewsCard(headline: "India wins Test series against Australia in dramatic fashion")
        .padding()
}
