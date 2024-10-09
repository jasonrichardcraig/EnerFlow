using System.ComponentModel;
using System.Windows.Controls;
using System.Windows.Data;


namespace EnerFlow.Views.UserControls.Setup
{
    /// <summary>
    /// Interaction logic for ContextTagControl.xaml
    /// </summary>
    public partial class ContextTagControl : UserControl
    {
        public ContextTagControl()
        {
            InitializeComponent();
        }

        private void PropertiesDataGrid_RowEditEnding(object sender, DataGridRowEditEndingEventArgs e)
        {
            if (sender is DataGrid dataGrid && dataGrid.SelectedItem != null)
            {
                var collectionView = CollectionViewSource.GetDefaultView(dataGrid.ItemsSource) as IEditableCollectionView;

                if (collectionView != null)
                {
                    if (collectionView.IsAddingNew)
                    {
                        // Commit new item if still in the adding state
                        collectionView.CommitNew();
                    }
                    else if (collectionView.IsEditingItem)
                    {
                        // Commit edit if still in the editing state
                        collectionView.CommitEdit();
                    }
                }
            }
        }
    }
}
