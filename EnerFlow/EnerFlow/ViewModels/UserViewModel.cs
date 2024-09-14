using EnerFlow.Models;

namespace EnerFlow.ViewModels
{
    public class UserViewModel : ViewModelBase
    {
        private readonly User _user;
        public UserViewModel(User user) => _user = user;

        public User User => _user;

        public string UserName => _user.UserName;
    }
}
