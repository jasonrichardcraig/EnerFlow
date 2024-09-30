using System.Windows;

namespace EnerFlow.Views.Dialogs
{
    /// <summary>
    /// Interaction logic for NewDeviceTagDialog.xaml
    /// </summary>
    public partial class NewDeviceTagDialog : Window
    {
        public NewDeviceTagDialog()
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
