import SwiftUI
import Domain

struct CurrentUserHeaderView: View {
    let user: FirebaseUser

    var body: some View {
        VStack(spacing: 16) {
            // Profile Photo
            if let photoURL = user.photoURL {
                AsyncImage(url: photoURL) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .foregroundColor(.gray)
                }
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.blue, lineWidth: 3)
                )
                .shadow(radius: 5)
            } else {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .foregroundColor(.blue)
                    .frame(width: 80, height: 80)
            }

            // User Info
            VStack(spacing: 4) {
                if let displayName = user.displayName {
                    Text(displayName)
                        .font(.title2)
                        .fontWeight(.bold)
                }

                if let email = user.email {
                    Text(email)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                // Provider Badge
                HStack(spacing: 4) {
                    Image(systemName: providerIcon)
                        .font(.caption)
                    Text(providerName)
                        .font(.caption)
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 4)
                .background(providerColor.opacity(0.2))
                .foregroundColor(providerColor)
                .cornerRadius(12)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.1), Color.purple.opacity(0.1)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(16)
        .shadow(radius: 2)
    }

    private var providerIcon: String {
        switch user.provider {
        case .email:
            return "envelope.fill"
        case .google:
            return "g.circle.fill"
        }
    }

    private var providerName: String {
        switch user.provider {
        case .email:
            return "Email"
        case .google:
            return "Google"
        }
    }

    private var providerColor: Color {
        switch user.provider {
        case .email:
            return .blue
        case .google:
            return .red
        }
    }
}
