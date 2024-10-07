using System.Windows;
using System.Windows.Controls;

namespace EnerFlow.Views.UserControls
{
    /// <summary>
    /// Interaction logic for NumericUpDownControl.xaml
    /// </summary>
    public partial class NumericUpDownControl : UserControl
    {
        public NumericUpDownControl()
        {
            InitializeComponent();
        }

        // Value property
        public int Value
        {
            get { return (int)GetValue(ValueProperty); }
            set { SetValue(ValueProperty, value); }
        }

        public static readonly DependencyProperty ValueProperty =
            DependencyProperty.Register("Value", typeof(int), typeof(NumericUpDownControl),
                new FrameworkPropertyMetadata(0, FrameworkPropertyMetadataOptions.BindsTwoWayByDefault, OnValueChanged));

        // Minimum property
        public int Minimum
        {
            get { return (int)GetValue(MinimumProperty); }
            set { SetValue(MinimumProperty, value); }
        }

        public static readonly DependencyProperty MinimumProperty =
            DependencyProperty.Register("Minimum", typeof(int), typeof(NumericUpDownControl), new PropertyMetadata(0));

        // Maximum property
        public int Maximum
        {
            get { return (int)GetValue(MaximumProperty); }
            set { SetValue(MaximumProperty, value); }
        }

        public static readonly DependencyProperty MaximumProperty =
            DependencyProperty.Register("Maximum", typeof(int), typeof(NumericUpDownControl), new PropertyMetadata(100));

        // Increment property
        public int Increment
        {
            get { return (int)GetValue(IncrementProperty); }
            set { SetValue(IncrementProperty, value); }
        }

        public static readonly DependencyProperty IncrementProperty =
            DependencyProperty.Register("Increment", typeof(int), typeof(NumericUpDownControl), new PropertyMetadata(1));

        private void IncreaseValue_Click(object sender, RoutedEventArgs e)
        {
            if (Value < Maximum)
            {
                Value += Increment;
            }
        }

        private void DecreaseValue_Click(object sender, RoutedEventArgs e)
        {
            if (Value > Minimum)
            {
                Value -= Increment;
            }
        }

        private static void OnValueChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            var control = d as NumericUpDownControl;
            if (control != null)
            {
                // You can add custom logic here if needed, e.g., validate the value
                control.txtValue.Text = e.NewValue.ToString();
            }
        }
    }
}
