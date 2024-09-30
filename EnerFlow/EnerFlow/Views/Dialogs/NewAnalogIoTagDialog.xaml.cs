using System.Windows;

namespace EnerFlow.Views.Dialogs
{
    /// <summary>
    /// Interaction logic for NewAnalogIoTagDialog.xaml
    /// </summary>
    public partial class NewAnalogIoTagDialog : Window
    {
        public NewAnalogIoTagDialog()
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
