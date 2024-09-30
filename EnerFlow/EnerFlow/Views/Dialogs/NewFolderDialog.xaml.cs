using System.Windows;

namespace EnerFlow.Views.Dialogs
{
    /// <summary>
    /// Interaction logic for NewFolderDialog.xaml
    /// </summary>
    public partial class NewFolderDialog : Window
    {
        public NewFolderDialog()
        {
            InitializeComponent();
        }

        private void OkButton_Click(object sender, RoutedEventArgs e)
        {
            DialogResult = true;
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            DialogResult = false;
        }
    }
}
