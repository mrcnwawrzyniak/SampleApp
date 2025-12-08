import SwiftUI
import Domain

struct ApiUserCardView: View {
    let user: ApiUser

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Header with name and username
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(user.name)
                        .font(.headline)
                        .fontWeight(.semibold)

                    Text("@\(user.username)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                Spacer()

                // ID Badge
                Text("#\(user.id)")
                    .font(.caption)
                    .fontWeight(.bold)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.blue.opacity(0.2))
                    .foregroundColor(.blue)
                    .cornerRadius(8)
            }

            Divider()

            // Contact Info
            VStack(alignment: .leading, spacing: 8) {
                InfoRow(icon: "envelope.fill", text: user.email, color: .blue)
                InfoRow(icon: "phone.fill", text: user.phone, color: .green)
                InfoRow(icon: "globe", text: user.website, color: .orange)
            }

            // Company Info
            if !user.company.name.isEmpty {
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Image(systemName: "building.2.fill")
                            .font(.caption)
                            .foregroundColor(.purple)
                        Text(user.company.name)
                            .font(.subheadline)
                            .fontWeight(.medium)
                    }

                    Text(user.company.catchPhrase)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .italic()
                }
                .padding(.top, 4)
            }

            // Location
            HStack {
                Image(systemName: "mappin.circle.fill")
                    .font(.caption)
                    .foregroundColor(.red)
                Text(user.address.city)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

struct InfoRow: View {
    let icon: String
    let text: String
    let color: Color

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: icon)
                .font(.caption)
                .foregroundColor(color)
                .frame(width: 20)

            Text(text)
                .font(.subheadline)
                .foregroundColor(.primary)
        }
    }
}
