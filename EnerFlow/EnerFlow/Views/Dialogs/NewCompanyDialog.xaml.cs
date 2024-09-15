using EnerFlow.Models;
using EnerFlow.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace EnerFlow.Views.Dialogs
{
    /// <summary>
    /// Interaction logic for NewCompanyDialog.xaml
    /// </summary>
    public partial class NewCompanyDialog : Window
    {
        private HierarchyViewModel? _hierarchyViewModel;
        public NewCompanyDialog()
        {
            InitializeComponent();
        }

        public required HierarchyViewModel CompanyHierarchyViewModel
        {
            get => _hierarchyViewModel!;
            set
            {
                _hierarchyViewModel = value;
                DataContext = _hierarchyViewModel;
            }
        }
    }
}
