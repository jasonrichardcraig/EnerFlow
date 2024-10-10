using EnerFlow.ViewModels;
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

        //private void PropertiesDataGrid_BeginningEdit(object sender, DataGridBeginningEditEventArgs e)
        //{
        //    if (e.Row.DataContext is ContextTagPropertyViewModel contextTagPropertyViewModel)
        //    {
        //        if (contextTagPropertyViewModel.HasErrors)
        //        {
        //            e.Cancel = true;
        //        }
        //    }
        //}

        //private void PropertiesDataGrid_RowEditEnding(object sender, DataGridRowEditEndingEventArgs e)
        //{
        //    if (sender is DataGrid dataGrid && dataGrid.SelectedItem != null)
        //    {
        //        var collectionView = CollectionViewSource.GetDefaultView(dataGrid.ItemsSource) as IEditableCollectionView;

        //        if (collectionView != null)
        //        {
        //            if (collectionView.IsAddingNew)
        //            {

        //                if (collectionView.CurrentAddItem is ContextTagPropertyViewModel contextTagPropertyViewModel)
        //                {
        //                    contextTagPropertyViewModel.ValidateAll();

        //                    if (contextTagPropertyViewModel.HasErrors)
        //                    {
        //                        collectionView.CancelNew();
        //                        return;
        //                    }

        //                    // Commit new item if still in the adding state
        //                    collectionView.CommitNew();
        //                }
        //            }
        //            else if (collectionView.IsEditingItem)
        //            {
        //                if (collectionView.CurrentEditItem is ContextTagPropertyViewModel contextTagPropertyViewModel)
        //                {



        //                    if (contextTagPropertyViewModel.HasErrors)
        //                    {
        //                        collectionView.CancelEdit();
        //                        return;
        //                    }

        //                    // Commit edit if still in the editing state
        //                    collectionView.CommitEdit();


        //                }
        //            }
        //        }
        //    }
        //}
    }
}
