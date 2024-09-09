using EnerFlow.Models;

namespace EnerFlow.Security
{
    public class SecurityChecker
    {
        public static bool HasAccess(User user)
        {
            // Check if the account is disabled
            if (user.AccountDisabled)
            {
                return false;
            }

            // Check if the user is a system administrator
            if (user.IsSystemAdministrator)
            {
                return true;
            }

            // Check if the user has the required role
            bool hasRequiredRole = user.Roles.Any(role => role.ManageAccounts || role.ManageTags || role.ManageAlarms || role.ManageHistoricalData);

            return hasRequiredRole;
        }
    }
}
