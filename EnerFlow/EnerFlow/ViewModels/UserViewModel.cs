using CommunityToolkit.Mvvm.ComponentModel;
using EnerFlow.Models;

namespace EnerFlow.ViewModels
{
    public class UserViewModel(User user) : ObservableObject
    {
        private readonly User _user = user;

        public User User => _user;

        public string UserName => _user.UserName;
    }
}
