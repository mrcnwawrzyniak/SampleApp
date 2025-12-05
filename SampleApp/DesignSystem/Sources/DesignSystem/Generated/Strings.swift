// Generated Localization Wrapper
// This provides type-safe access to localized strings

import Foundation

public enum L10n {
    // MARK: - Dashboard
    public enum Dashboard {
        public enum Alert {
            public enum Button {
                /// "Cancel" / "Anuluj"
                public static let cancel = String(localized: "dashboard.alert.button.cancel", bundle: .module)
                /// "Logout" / "Wyloguj"
                public static let logout = String(localized: "dashboard.alert.button.logout", bundle: .module)
            }
            /// "Are you sure you want to logout?" / "Czy na pewno chcesz się wylogować?"
            public static let confirmLogout = String(localized: "dashboard.alert.confirmLogout", bundle: .module)
        }
        public enum Button {
            /// "Show Logout Alert" / "Pokaż alert wylogowania"
            public static let logoutAlert = String(localized: "dashboard.button.logoutAlert", bundle: .module)
            /// "Show Settings" / "Pokaż ustawienia"
            public static let settings = String(localized: "dashboard.button.settings", bundle: .module)
        }
    }

    // MARK: - Login
    public enum Login {
        public enum Button {
            /// "Log in" / "Zaloguj się"
            public static let login = String(localized: "login.button.login", bundle: .module)
        }
        public enum Error {
            /// "Google Sign-In not implemented yet" / "Logowanie przez Google nie zostało jeszcze zaimplementowane"
            public static let googleNotImplemented = String(localized: "login.error.googleNotImplemented", bundle: .module)
            /// "Login error" / "Błąd logowania"
            public static let loginFailed = String(localized: "login.error.loginFailed", bundle: .module)
            /// "Email cannot be empty" / "Pole e-mail nie może być puste"
            public static let emailEmpty = String(localized: "login.error.emailEmpty", bundle: .module)
            /// "Password cannot be empty" / "Pole hasła nie może być puste"
            public static let passwordEmpty = String(localized: "login.error.passwordEmpty", bundle: .module)
            /// "Please enter a valid email" / "Wprowadź poprawny adres e-mail"
            public static let emailInvalid = String(localized: "login.error.emailInvalid", bundle: .module)
            /// "Password must be at least 6 characters" / "Hasło musi mieć co najmniej 6 znaków"
            public static let passwordTooShort = String(localized: "login.error.passwordTooShort", bundle: .module)
        }
        public enum Header {
            /// "Insert your username and password here" / "Wpisz tutaj swoją nazwę użytkownika i hasło"
            public static let subtitle = String(localized: "login.header.subtitle", bundle: .module)
            /// "Sign in" / "Zaloguj się"
            public static let title = String(localized: "login.header.title", bundle: .module)
        }
        public enum Separator {
            /// "or" / "lub"
            public static let divider = String(localized: "login.separator.divider", bundle: .module)
        }
        public enum Social {
            /// "Sign in" / "Zaloguj się"
            public static let signin = String(localized: "login.social.signin", bundle: .module)
        }
    }

    // MARK: - Common
    /// "E-mail" / "E-mail"
    public static let email = String(localized: "e_mail", bundle: .module)
    /// "Sign in" / "Zaloguj się"
    public static let logIn = String(localized: "log_in", bundle: .module)
    /// "Sign in via Google" / "Zaloguj się przez Google"
    public static let logInViaGoogle = String(localized: "log_in_via_google", bundle: .module)
    /// "Password" / "Hasło"
    public static let password = String(localized: "password", bundle: .module)
}

