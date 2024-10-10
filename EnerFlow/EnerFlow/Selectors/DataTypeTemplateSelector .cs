using EnerFlow.Helpers;
using EnerFlow.ViewModels;
using System.Windows;
using System.Windows.Controls;

namespace EnerFlow.Selectors
{

    internal class DataTypeTemplateSelector : DataTemplateSelector
    {
        public DataTemplate? BooleanTemplate { get; set; }

        public DataTemplate? FloatTemplate { get; set; }

        public DataTemplate? StringTemplate { get; set; }

        /// <summary>
        /// Selects the appropriate DataTemplate based on the type of DataType.
        /// </summary>
        /// <param name="item">The data item.</param>
        /// <param name="container">The container.</param>
        /// <returns>The selected DataTemplate.</returns>
        public override DataTemplate SelectTemplate(object item, DependencyObject container)
        {
            if (item is ContextTagPropertyViewModel contextTagPropertyViewModel)
            {
                return contextTagPropertyViewModel.Type switch
                {
                    "Boolean" => BooleanTemplate ?? base.SelectTemplate(item, container),
                    "Float" => FloatTemplate ?? base.SelectTemplate(item, container),
                    "String" => StringTemplate ?? base.SelectTemplate(item, container),
                    _ => base.SelectTemplate(item, container),
                };
            }
            else
            {
                return base.SelectTemplate(item, container);
            }
        }
    }
}