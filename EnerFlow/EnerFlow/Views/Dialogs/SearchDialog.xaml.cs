using CommunityToolkit.Mvvm.DependencyInjection;
using EnerFlow.ViewModels;
using System.Windows;

namespace EnerFlow.Views.Dialogs
{
    /// <summary>
    /// Interaction logic for SearchWindow.xaml
    /// </summary>
    public partial class SearchDialog : Window
    {
        public SearchDialog()
        {
            InitializeComponent();
        }

        private void ResultsListBox_MouseDoubleClick(object sender, System.Windows.Input.MouseButtonEventArgs e)
        {
            if (ResultsListBox.SelectedItem != null && ResultsListBox.SelectedItem is SearchResultViewModel searchResultViewModel)
            {
                var mainViewModel = Ioc.Default.GetService<MainViewModel>();

                if (mainViewModel != null)
                {
                    MainViewModel.SelectAndExpandNode(mainViewModel.SystemHierarchyViewModel, searchResultViewModel.Node);
                    DialogResult = true;
                }
            }
        }
    }
}
