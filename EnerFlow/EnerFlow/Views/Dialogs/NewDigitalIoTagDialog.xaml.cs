using System.Windows;

namespace EnerFlow.Views.Dialogs
{
    /// <summary>
    /// Interaction logic for NewDigitalIoTagDialog.xaml
    /// </summary>
    public partial class NewDigitalIoTagDialog : Window
    {
        public NewDigitalIoTagDialog()
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
