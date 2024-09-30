﻿using System.Windows;

namespace EnerFlow.Views.Dialogs
{
    /// <summary>
    /// Interaction logic for NewSerialPortChannelTagDialog.xaml
    /// </summary>
    public partial class NewSerialPortChannelTagDialog : Window
    {
        public NewSerialPortChannelTagDialog()
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
